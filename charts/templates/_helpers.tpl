
{{- define "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.fullname" -}}
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


{{- define "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.labels" -}}
helm.sh/chart: {{ include "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.chart" . }}
{{ include "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb5fde46-d0d0-4c09-90bc-f5b72ab2c47e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}