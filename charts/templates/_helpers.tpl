
{{- define "go-echoea41f043-2739-4914-a4a5-24954e94623b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea41f043-2739-4914-a4a5-24954e94623b.fullname" -}}
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


{{- define "go-echoea41f043-2739-4914-a4a5-24954e94623b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea41f043-2739-4914-a4a5-24954e94623b.labels" -}}
helm.sh/chart: {{ include "go-echoea41f043-2739-4914-a4a5-24954e94623b.chart" . }}
{{ include "go-echoea41f043-2739-4914-a4a5-24954e94623b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea41f043-2739-4914-a4a5-24954e94623b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea41f043-2739-4914-a4a5-24954e94623b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}