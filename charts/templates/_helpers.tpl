
{{- define "go-echoae480856-0a87-40f0-8b50-918e131b43ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae480856-0a87-40f0-8b50-918e131b43ca.fullname" -}}
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


{{- define "go-echoae480856-0a87-40f0-8b50-918e131b43ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae480856-0a87-40f0-8b50-918e131b43ca.labels" -}}
helm.sh/chart: {{ include "go-echoae480856-0a87-40f0-8b50-918e131b43ca.chart" . }}
{{ include "go-echoae480856-0a87-40f0-8b50-918e131b43ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae480856-0a87-40f0-8b50-918e131b43ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae480856-0a87-40f0-8b50-918e131b43ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}