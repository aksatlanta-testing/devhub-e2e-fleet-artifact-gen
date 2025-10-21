
{{- define "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.fullname" -}}
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


{{- define "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.labels" -}}
helm.sh/chart: {{ include "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.chart" . }}
{{ include "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa0cf1207-87a8-45a9-a863-c6132eab06b2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}