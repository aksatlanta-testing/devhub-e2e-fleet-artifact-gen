
{{- define "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.fullname" -}}
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


{{- define "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.labels" -}}
helm.sh/chart: {{ include "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.chart" . }}
{{ include "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5bf4f9a6-e855-495b-a520-1ae4616dbedb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}