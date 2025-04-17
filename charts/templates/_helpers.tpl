
{{- define "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.fullname" -}}
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


{{- define "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.labels" -}}
helm.sh/chart: {{ include "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.chart" . }}
{{ include "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo89676f30-cf6b-4a16-bb17-566198dd9d50.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}