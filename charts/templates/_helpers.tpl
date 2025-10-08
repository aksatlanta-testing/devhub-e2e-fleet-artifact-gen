
{{- define "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.fullname" -}}
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


{{- define "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.labels" -}}
helm.sh/chart: {{ include "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.chart" . }}
{{ include "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed0a047b-c59e-4f57-a46d-e60d82e802ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}