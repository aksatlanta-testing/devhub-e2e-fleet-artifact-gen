
{{- define "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.fullname" -}}
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


{{- define "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.labels" -}}
helm.sh/chart: {{ include "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.chart" . }}
{{ include "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc44e8e19-fb16-4db6-a232-3a03c76fd25b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}