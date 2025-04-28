
{{- define "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.fullname" -}}
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


{{- define "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.labels" -}}
helm.sh/chart: {{ include "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.chart" . }}
{{ include "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo39c75588-13ce-4860-85e5-42b8c0dbbafa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}