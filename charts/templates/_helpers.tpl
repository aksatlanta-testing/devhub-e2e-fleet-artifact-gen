
{{- define "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.fullname" -}}
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


{{- define "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.labels" -}}
helm.sh/chart: {{ include "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.chart" . }}
{{ include "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee94b757-e8df-4619-8333-2d8cce5c7534.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}