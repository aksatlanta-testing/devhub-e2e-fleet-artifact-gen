
{{- define "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.fullname" -}}
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


{{- define "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.labels" -}}
helm.sh/chart: {{ include "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.chart" . }}
{{ include "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd57c38f-0f03-4a86-b6a7-ac99434bd439.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}