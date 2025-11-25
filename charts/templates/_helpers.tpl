
{{- define "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.fullname" -}}
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


{{- define "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.labels" -}}
helm.sh/chart: {{ include "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.chart" . }}
{{ include "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd3e5ffe-7fd0-435a-803e-4c6ee5c58833.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}