
{{- define "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.fullname" -}}
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


{{- define "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.labels" -}}
helm.sh/chart: {{ include "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.chart" . }}
{{ include "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab88bccb-d2ab-40cc-b8ef-cb9f65c0a356.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}