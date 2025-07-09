
{{- define "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.fullname" -}}
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


{{- define "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.labels" -}}
helm.sh/chart: {{ include "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.chart" . }}
{{ include "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd6fb96b-d2f6-4850-b0b9-5af8517c8888.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}