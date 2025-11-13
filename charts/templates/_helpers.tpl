
{{- define "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.labels" -}}
helm.sh/chart: {{ include "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.chart" . }}
{{ include "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc516ff1e-281d-4ca6-8781-ccf8e7c390ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}