
{{- define "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.fullname" -}}
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


{{- define "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.labels" -}}
helm.sh/chart: {{ include "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.chart" . }}
{{ include "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo78b7841a-f8bb-44c4-a03e-2ddacc57118b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}