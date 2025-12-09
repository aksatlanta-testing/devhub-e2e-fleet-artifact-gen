
{{- define "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.fullname" -}}
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


{{- define "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.labels" -}}
helm.sh/chart: {{ include "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.chart" . }}
{{ include "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo220608ea-5d18-4add-86e6-10f928ce3f2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}