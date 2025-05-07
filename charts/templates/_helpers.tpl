
{{- define "go-echofe034b0d-b973-4295-979d-791cb3806a41.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe034b0d-b973-4295-979d-791cb3806a41.fullname" -}}
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


{{- define "go-echofe034b0d-b973-4295-979d-791cb3806a41.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe034b0d-b973-4295-979d-791cb3806a41.labels" -}}
helm.sh/chart: {{ include "go-echofe034b0d-b973-4295-979d-791cb3806a41.chart" . }}
{{ include "go-echofe034b0d-b973-4295-979d-791cb3806a41.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe034b0d-b973-4295-979d-791cb3806a41.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe034b0d-b973-4295-979d-791cb3806a41.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}